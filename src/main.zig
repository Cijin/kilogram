const std = @import("std");

const kg = @import("kilogram.zig");

pub fn main() !void {
    // Todo:
    // 1. Create "Server" -> recieves udp packets from "Client"
    // 2. Write test to simulate client and server
    // 3. Create udp socket and send "hello udp" from client to server
    // 4. I want to be able to visualize the whole thing? How?
    _ = try kg.encode("yellow");
}
