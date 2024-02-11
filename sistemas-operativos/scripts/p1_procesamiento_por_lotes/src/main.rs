mod process;
mod screen;
//mod screen;

use regex::Regex;
use rand::Rng;
use std::io::{self, Write};
use std::process::Command;
use std::thread;
use std::time::Duration;

const LOTE: usize = 4;
const MAX: usize = 30;

fn main() {
    println!("Welcome to the Process Simulator\n");
    print!("Enter the number of process to execute: ");
    io::stdout().flush().expect("Failed to flush stdout");

    let mut num_process = String::new();
    io::stdin()
        .read_line(&mut num_process)
        .expect("Failed to read number");

    let mut int_num_process : usize = num_process.trim().parse().unwrap();

    let batches_res : usize = int_num_process % LOTE;
    let batches_cos : usize = int_num_process / LOTE;
    let mut batches : usize = batches_cos + if batches_res != 0 { 1 } else { 0 };

    println!("Bacth: {batches}");

    let mut processes : [process::Process; MAX] = Default::default();

    for n in 0..int_num_process {
        println!("Process: {} of {}", n+1, num_process);

        print!("Programmer name: ");
        io::stdout().flush().expect("Failed to flush stdout");

        processes[n].set_username();

        println!("Math Expression: ");
        io::stdout().flush().expect("Failed to flush stdout");
        processes[n].set_math_exp();

        processes[n].set_exe_time(rand::thread_rng().gen_range(1..=3));
    }

    screen::sys_pause();
    screen::sys_clear();

    let mut k = 0;

    for i in 0..batches {
        println!("Batch in execution: {} de {}\n", i+1, batches);

        if k < int_num_process - batches_res {
            println!("Es VERDADERO");
            for j in k..LOTE+k {
                finished_processes(&processes, j, k);
                k=j+1;
            }
        } else if batches_res > 0 {
            for j in k..int_num_process {
                finished_processes(&processes, j, k);
                k=j+1;
            }
        }

        println!("-----------------------------------------------------------------------");

        //screen::sys_pause();
        //screen::sys_clear();
    }

}

fn finished_processes(arr : &[process::Process; MAX], j : usize, k : usize){
    println!("Programa: {}", k+1);
    println!("Nombre: {}", arr[j].get_username());
    println!("Operation: {}", arr[j].get_math_exp());
    println!("Estimated execution time {}\n\n", (arr[j].get_exe_time()));
    thread::sleep(Duration::from_secs(arr[j].get_exe_time())); 
}

fn get_result(){
    // Regex

    let re_add = Regex::new(r"(\d+)\s?\+\s?(\d+)").unwrap();
    let re_sub = Regex::new(r"(\d+)\s?\-\s?(\d+)").unwrap();
    let re_mul = Regex::new(r"(\d+)\s?\*\s?(\d+)").unwrap();
    let re_div = Regex::new(r"(\d+)\s?/\s?(\d+)").unwrap();

    // User input

    println!("Enter an expression to evaluate:");
    io::stdout().flush().expect("Failed to flush stdout");
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).unwrap();

    input = math_operation(re_mul, input.clone(), "*");
    input = math_operation(re_div, input.clone(), "/");
    input = math_operation(re_add, input.clone(), "+");
    input = math_operation(re_sub, input.clone(), "-");

    // Show results

    println!("Result: {}", input);
}

fn math_operation(expression: Regex, mut operation: String, operator: &str) -> String {
    loop {
        let caps = expression.captures(operation.as_str());
        if caps.is_none() {
            break;
        }
        let caps = caps.unwrap();
        let caps_expression = caps.get(0).unwrap().as_str();
        let caps_num1 = caps.get(1).unwrap().as_str().parse::<i32>().unwrap();
        let caps_num2 = caps.get(2).unwrap().as_str().parse::<i32>().unwrap();
        let result = match operator {
            "+" => caps_num1 + caps_num2,
            "-" => caps_num1 - caps_num2,
            "*" => caps_num1 * caps_num2,
            "/" => caps_num1 / caps_num2,
            _ => 0,
        };
        operation = operation.replace(caps_expression, &result.to_string());
    }
    operation
}
