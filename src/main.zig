const std = @import("std");
const net = std.net;
const posix = std.posix;

const kg = @import("kilogram.zig");

pub fn main() !void {
    _ = try kg.encode("yellow");

    // Todo: create server code
    // Client code switch from rev to write
    const sockfd = posix.socket(posix.AF.INET, posix.SOCK.DGRAM, posix.IPPROTO.UDP) catch |err| {
        std.debug.print("unable to start socket:{any}\n", .{err});
        return;
    };
    defer posix.close(sockfd);

    const addr = net.Address.parseIp("127.0.0.1", 42069) catch |err| {
        std.debug.print("unable to parse ip:{any}\n", .{err});
        return;
    };
    posix.bind(sockfd, &addr.any, addr.getOsSockLen()) catch |err| {
        std.debug.print("unable to bind addr to socket:{any}\n", .{err});
        return;
    };

    var buf: [1024]u8 = undefined;
    const len = std.posix.recvfrom(sockfd, &buf, 0, null, null) catch |err| {
        std.debug.print("error while recieving:{any}\n", .{err});
        return;
    };
    std.debug.print("recv: {s}\n", .{buf[0..len]});
}
