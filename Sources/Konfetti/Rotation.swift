//   __  __     ______     __   __     ______   ______     ______   ______   __
//  /\ \/ /    /\  __ \   /\ "-.\ \   /\  ___\ /\  ___\   /\__  _\ /\__  _\ /\ \
//  \ \  _"-.  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \  __\   \/_/\ \/ \/_/\ \/ \ \ \
//   \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_____\    \ \_\    \ \_\  \ \_\
//    \/_/\/_/   \/_____/   \/_/ \/_/   \/_/     \/_____/     \/_/     \/_/   \/_/
//

import simd

public struct Rotation {

    public let radians: Float
    public let degrees: Float
    public let direction: vector_float2

    init() {
        self.init(rad: 0.0)
    }

    init(degrees: Float) {
        let rad = degrees * (.pi / 180.0)
        self.init(rad: rad)
    }

    init(direction: vector_float2) {
        if simd_length_squared(direction) < 0.00001 {
            self.init()
        } else {
            let rad = atan2(direction.y, direction.x)
            self.init(rad: rad)
        }
    }

    init(rad: Float) {
        radians = rad
        degrees = rad * (180.0 / .pi)
        direction = [cos(rad), sin(rad)]
    }
}

// MARK: Convenience

public extension Rotation {

    static func degrees(_ degrees: Float) -> Rotation {
        self.init(degrees: degrees)
    }

    static func rad(_ rad: Float) -> Rotation {
        self.init(rad: rad)
    }

    static func direction(_ direction: vector_float2) -> Rotation {
        self.init(direction: direction)
    }

    static var zero: Rotation {
        self.init()
    }
}
