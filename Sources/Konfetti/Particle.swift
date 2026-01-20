//   __  __     ______     __   __     ______   ______     ______   ______   __
//  /\ \/ /    /\  __ \   /\ "-.\ \   /\  ___\ /\  ___\   /\__  _\ /\__  _\ /\ \
//  \ \  _"-.  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \  __\   \/_/\ \/ \/_/\ \/ \ \ \
//   \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_____\    \ \_\    \ \_\  \ \_\
//    \/_/\/_/   \/_____/   \/_/ \/_/   \/_/     \/_____/     \/_/     \/_/   \/_/
//

import simd

// MARK: - Particle

public struct Particle: Hashable {
    public var type: Int = 0
    public var position: vector_float2 = .zero
    public var velocity: vector_float2 = .zero
    public var gravity: vector_float2 = .zero
    public var rotation: Float = 0.0
    public var rotationVelocity: Float = 0.0
    public var colorStart: vector_float4 = .one
    public var colorEnd: vector_float4 = .one
    public var sizeStart: Float = 1.0
    public var sizeEnd: Float = 1.0
    public var lifetime: Float = 1.0
    public var lifeRemaining: Float = 1.0
    public var isActive: Bool = false
}

// MARK: Convenience

public extension Particle {

    var lifePercentage: Float {
        let percentage = 1.0 - (lifeRemaining / lifetime)
        return max(0.0, percentage)
    }

    var currentColor: vector_float4 {
        simd_mix(colorStart, colorEnd, vector_float4(repeating: lifePercentage))
    }

    var currentSize: Float {
        lerp(sizeStart, sizeEnd, lifePercentage)
    }
}

// MARK: Internal

package extension Particle {

    mutating
    func update(ts: Float) {
        guard isActive else { return }

        guard lifeRemaining > 0 else {
            isActive = false
            return
        }

        lifeRemaining -= ts
        position += velocity * ts
        rotation += rotationVelocity * ts
        velocity += gravity * ts
    }
}
