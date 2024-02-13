mod process;
mod screen;
mod reg_cal;

use rand::Rng;
use std::io::{self, Write};
use std::time::{Instant};

const LOTE: usize = 4;

fn main() {
    let start = Instant::now();
    screen::sys_clear();

    let mut num_process;
    let int_num_process: usize;

    loop {
        println!("Welcome to the Process Simulator\n");
        print!("Enter the number of processes to execute: ");
        io::stdout().flush().expect("Failed to flush stdout");

        num_process = String::new();
        io::stdin()
            .read_line(&mut num_process)
            .expect("Failed to read number");

        int_num_process = match num_process.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Invalid input. Please, enter a valid integer");
                screen::sys_pause();
                screen::sys_clear();
                continue; // Continue to the next iteration of the loop
            }
        };
        break;
    }

        //let int_num_process : usize = num_process.trim().parse().unwrap();

    let batches_res : usize = int_num_process % LOTE;
    let batches_cos : usize = int_num_process / LOTE;
    let batches : usize = batches_cos + if batches_res != 0 { 1 } else { 0 };

    println!("Bacth: {batches}");

    let mut processes : Vec<process::Process> = Vec::new();
    //let mut processes : [process::Process; MAX] = Default::default();

    for n in 0..int_num_process {
        processes.push(process::Process::new(String::from(""), String::from(""), String::from(""), 0));

        loop {
            println!("Process: {} of {}", n+1, num_process);

            if processes[n].get_username().is_empty(){
                print!("Programmer name: ");
                io::stdout().flush().expect("Failed to flush stdout");
                processes[n].set_username();
            }


            if processes[n].get_username().is_empty(){
                println!("Username cannot be empty. Please enter a valid name.");
                screen::sys_pause();
                screen::sys_clear();
                continue; // Continue to the next iteration of the loop
            }

            print!("Math Expression: ");
            io::stdout().flush().expect("Failed to flush stdout");
            processes[n].set_math_exp();

            if processes[n].get_math_exp().is_empty(){
                println!("Math Expression cannot be empty. Please enter a valid math expression.");
                screen::sys_pause();
                screen::sys_clear();
                continue; // Continue to the next iteration of the loop
            }

            processes[n].set_exe_time(rand::thread_rng().gen_range(1..=50));
            break;
        }
    }

    screen::sys_pause();
    screen::sys_clear();

    let mut k = 0;
    let mut l = 0;
    let mut time: Vec<u64> = Vec::new();

    for i in 0..batches {

        // Calculation of Batch Times

        time.push(0);

        if l < int_num_process - batches_res {
            for j in l..LOTE+k {
                time[i] += processes[j].get_exe_time();
                l=j+1;
            }
        } else if batches_res > 0 {
            for j in l..int_num_process {
                time[i] += processes[j].get_exe_time();
                l=j+1;
            }
        }

        // Current Bath

        working_batch(&processes, &time, i, batches);

        // Processes in Execution

        if k < int_num_process - batches_res {
            for j in k..LOTE+k {
                processes[j].calculate_ans_exp();
                working_processes(&processes, j, k, &time);
                time[i] -= processes[j].get_exe_time();
                println!("Time left: {}µs\n\n", time[i]);
                processes[j].get_math_exp();
                //processes[j].set_ans_exp(get_result(processes[j].get_math_exp()));
                k=j+1;
            }
        } else if batches_res > 0 {
            for j in k..int_num_process {
                processes[j].calculate_ans_exp();
                working_processes(&processes, j, k, &time);
                time[i] -= processes[j].get_exe_time();
                //processes[j].set_ans_exp(get_result(processes[j].get_math_exp()));
                println!("Time left: {}µs\n\n ", time[i]);
                k=j+1;
            }
            
        }

        println!("-----------------------------------------------------------------------");

    }

    screen::sys_pause();
    screen::sys_clear();

    k = 0;

    println!("Finished batches");

    for i in 0..batches {
        finished_batch(&processes, i, batches);

        // Processes in Execution

        if k < int_num_process - batches_res {
            for j in k..LOTE+k {
                finished_processes(&processes, j);
                k=j+1;
            }
        } else if batches_res > 0 {
            for j in k..int_num_process {
                finished_processes(&processes, j);
                k=j+1;
            }

        }

        println!("-----------------------------------------------------------------------");

    }

    let duration = start.elapsed();

    println!("Program Execution Time: {:?}", duration);
}

fn working_batch(_arr : &Vec<process::Process>, arr_2: &Vec<u64>, i : usize, batches : usize) {
    println!("Batch in execution: {} de {}\n", i+1, batches);
    println!("Estimated execution time {}µs\n\n", arr_2[i]);
}

fn finished_batch(_arr : &Vec<process::Process>, i : usize, batches : usize) {
    println!("Batch: {} de {}\n", i+1, batches);
}


fn finished_processes(arr : &Vec<process::Process>, j : usize) {
    println!("Nombre: {}", arr[j].get_username());
    println!("Operation: {} = {}\n\n", arr[j].get_math_exp(), arr[j].get_ans_exp());
}

fn working_processes(arr : &Vec<process::Process>, j : usize, k : usize, _times : &Vec<u64>) {
    let start = Instant::now();
    println!("Program (ID): {}", k+1);
    println!("Nombre: {}", arr[j].get_username());
    println!("Estimated execution time {}µs", (arr[j].get_exe_time()));
    println!("Operation: {} = {}", arr[j].get_math_exp(), arr[j].get_ans_exp());
    let duration = start.elapsed();
    println!("Time elapsed: is: {:?}", duration);
}
