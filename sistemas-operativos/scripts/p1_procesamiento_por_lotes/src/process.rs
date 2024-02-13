use crate::reg_cal;

use regex::Regex;
use std::io::{self}; // Importing io and Write trait

#[derive(Default, Debug)]
pub struct Process {
    username: String,
    math_exp: String,
    ans_exp: String,
    exe_time: u64,
}

impl Process {
    // Method to create a new instance of Process
    pub fn new(username: String, math_exp: String, ans_exp: String, exe_time: u64) -> Self {
        Process {
            username,
            math_exp,
            ans_exp,
            exe_time,
        }
    }

    pub fn get_username(&self) -> &str {
        return &self.username;
    }

    pub fn set_username(&mut self) {
        io::stdin()
            .read_line(&mut self.username)
            .expect("Failed to read line");
        self.username = self.username.trim().to_string();
    }

    pub fn get_math_exp(&self) -> &str {
        return &self.math_exp;
    }

    pub fn set_math_exp(&mut self) {
        io::stdin()
            .read_line(&mut self.math_exp)
            .expect("Failed to read line");
        self.math_exp = self.math_exp.trim().to_string();
    }

    pub fn get_ans_exp(&self) -> &str {
        return &self.ans_exp;
    }

    pub fn _set_ans_exp(&mut self) {
        io::stdin()
            .read_line(&mut self.ans_exp)
            .expect("Failed to read line");
        self.ans_exp = self.ans_exp.trim().to_string();
    }

    pub fn calculate_ans_exp(&mut self) {
        // Regex

        let re_add = Regex::new(r"(\d+)\s?\+\s?(\d+)").unwrap();
        let re_sub = Regex::new(r"(\d+)\s?\-\s?(\d+)").unwrap();
        let re_mul = Regex::new(r"(\d+)\s?\*\s?(\d+)").unwrap();
        let re_div = Regex::new(r"(\d+)\s?/\s?(\d+)").unwrap();

        let mut input = self.math_exp.clone();

        input = reg_cal::math_operation(re_mul, input.clone(), "*");
        input = reg_cal::math_operation(re_div, input.clone(), "/");
        input = reg_cal::math_operation(re_add, input.clone(), "+");
        input = reg_cal::math_operation(re_sub, input.clone(), "-");

        self.ans_exp = input.clone();
    }

    pub fn get_exe_time(&self) -> u64 {
        return self.exe_time;
    }

    pub fn set_exe_time(&mut self, value: u64) {
        self.exe_time = value;
    }
}
