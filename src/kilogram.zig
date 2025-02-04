const std = @import("std");
const mem = std.mem;

const version: u8 = 1;
const udp_mtu: u16 = 1460;
const variance: u16 = 8;
const header_size: u16 = 8 + 8 + 16 + variance;
const data_buf_size = udp_mtu - header_size;

const PacketSizeError = error{
    TooBig,
};

const kilogram = struct {
    version: u8,
    encoding_type: u8,
    data_length: u16,
    data: [data_buf_size]u8,
};

pub fn encode(d: []const u8) PacketSizeError!kilogram {
    var data: [data_buf_size]u8 = undefined;
    if (d.len > data_buf_size) {
        return PacketSizeError.TooBig;
    }
    @memcpy(data[0..d.len], d);

    return kilogram{
        .version = version,
        .encoding_type = 0,
        .data_length = @intCast(d.len),
        .data = data,
    };
}
