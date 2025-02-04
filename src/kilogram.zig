const std = @import("std");

const udp_mtu: u16 = 1460;
const variance: u16 = 8;
const header_size: u16 = 8 + 8 + 16 + variance;
const data_buf_size = udp_mtu - header_size;

const kilogram = struct {
    version: u8,
    encoding_type: u8,
    len: u16,
    data: [data_buf_size]u8,

    // encode
    pub fn encode(d: []u8) void {
        std.debug.print("{s}\n", .{d});
    }

    // frame
};
