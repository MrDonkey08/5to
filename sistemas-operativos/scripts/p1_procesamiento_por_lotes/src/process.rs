use std::io::{self, Write}; // Importing io and Write trait

#[derive(Default, Debug)]
pub struct Process {
    id: i8,
    username: String,
    math_exp: String,
    ans_exp: i32,
    exe_time: u64,
}

impl Process {
    pub fn get_id(&self) -> i8 {
        return self.id;
    }

    pub fn set_id(&mut self, value: i8) {
        self.id = value;
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

    pub fn get_ans_exp(&self) -> i32 {
        return self.ans_exp;
    }

    pub fn set_ans_exp(&mut self, value: i32) {
        return self.ans_exp = value;
    }

    pub fn get_exe_time(&self) -> u64 {
        return self.exe_time;
    }

    pub fn set_exe_time(&mut self, value: u64) {
        return self.exe_time = value;
    }
}
