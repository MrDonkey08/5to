use std::sync::{Arc, Mutex};
use std::thread;
use std::io::{self, Write};
use std::time::{Instant, Duration};
use term_size;

// Define a struct to hold the start time
pub struct TimeCounter {
    start_time: Arc<Mutex<Instant>>,
}

impl TimeCounter {
    pub fn new() -> Self {
        TimeCounter {
            start_time: Arc::new(Mutex::new(Instant::now())),
        }
    }

    pub fn start_counter(self) { // Accepts self by value
        let start_time_clone = Arc::clone(&self.start_time);
        thread::spawn(move || {
            loop {
                thread::sleep(Duration::from_secs(1)); // Adjust the interval as needed
                self.display_elapsed_time(&start_time_clone);
            }
        });
    }

    fn display_elapsed_time(&self, start_time: &Arc<Mutex<Instant>>) {
        // Get terminal size
        let (width, _) = term_size::dimensions().unwrap_or((80, 24)); // Default dimensions if unable to determine

        // Calculate the position to display the elapsed time (top right corner)
        let elapsed_time_position = format!("\x1B[{};{}H", 1, width - 30); // Adjust the position as needed

        // Lock the Mutex to access the start time
        if let Ok(start_time) = start_time.lock() {
            // Calculate the elapsed time
            let elapsed = start_time.elapsed();

            // Print escape code to move cursor to elapsed time position
            print!("{}", elapsed_time_position);

            // Display the elapsed time
            println!("Elapsed time: {}.{:03} seconds", elapsed.as_secs(), elapsed.subsec_millis());
            
            // Flush stdout to ensure the output is immediately visible
            io::stdout().flush().expect("Failed to flush stdout");
        } else {
            println!("Failed to acquire lock on start time.");
        }
    }
}

