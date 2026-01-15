//   __  __     ______     __   __     ______   ______     ______   ______   __
//  /\ \/ /    /\  __ \   /\ "-.\ \   /\  ___\ /\  ___\   /\__  _\ /\__  _\ /\ \
//  \ \  _"-.  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \  __\   \/_/\ \/ \/_/\ \/ \ \ \
//   \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_____\    \ \_\    \ \_\  \ \_\
//    \/_/\/_/   \/_____/   \/_/ \/_/   \/_/     \/_____/     \/_/     \/_/   \/_/
//

import Foundation

extension BinaryFloatingPoint where Self.RawSignificand: FixedWidthInteger {

    static var random: Self {
        .random(in: 0.0 ... 1.0)
    }
}

@inline(__always)
func lerp<V: BinaryFloatingPoint, T: BinaryFloatingPoint>(_ v0: V, _ v1: V, _ t: T) -> V {
    v0 + V(t) * (v1 - v0)
}
