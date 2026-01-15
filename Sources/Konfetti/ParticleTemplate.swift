//   __  __     ______     __   __     ______   ______     ______   ______   __
//  /\ \/ /    /\  __ \   /\ "-.\ \   /\  ___\ /\  ___\   /\__  _\ /\__  _\ /\ \
//  \ \  _"-.  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \  __\   \/_/\ \/ \/_/\ \/ \ \ \
//   \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_____\    \ \_\    \ \_\  \ \_\
//    \/_/\/_/   \/_____/   \/_/ \/_/   \/_/     \/_____/     \/_/     \/_/   \/_/
//

import simd

public struct ParticleTemplate: Hashable {
    public var type: Int
    public var position: vector_float2
    public var direction: vector_float2
    public var directionVariation: Float
    public var velocity: Float
    public var velocityVariation: Float
    public var rotationSpeed: Float
    public var rotationSpeedVariation: Float
    public var colorStart: vector_float4
    public var colorEnd: vector_float4
    public var sizeStart: Float
    public var sizeEnd: Float
    public var sizeVariation: Float
    public var lifetime: Float

    public init(type: Int,
                position: vector_float2,
                direction: vector_float2,
                directionVariation: Float,
                velocity: Float,
                velocityVariation: Float,
                rotationSpeed: Float,
                rotationSpeedVariation: Float,
                colorStart: vector_float4,
                colorEnd: vector_float4,
                sizeStart: Float,
                sizeEnd: Float,
                sizeVariation: Float,
                lifetime: Float) {
        self.type = type
        self.position = position
        self.direction = direction
        self.directionVariation = directionVariation
        self.velocity = velocity
        self.velocityVariation = velocityVariation
        self.rotationSpeed = rotationSpeed
        self.rotationSpeedVariation = rotationSpeedVariation
        self.colorStart = colorStart
        self.colorEnd = colorEnd
        self.sizeStart = sizeStart
        self.sizeEnd = sizeEnd
        self.sizeVariation = sizeVariation
        self.lifetime = lifetime
    }
}

// MARK: Convenience

public extension ParticleTemplate {

    init(type: Int = 0,
         position: vector_float2,
         direction: Rotation,
         directionVariation: Rotation,
         velocity: Float,
         velocityVariation: Float,
         rotationSpeed: Rotation,
         rotationSpeedVariation: Rotation,
         colorStart: vector_float4,
         colorEnd: vector_float4,
         sizeStart: Float,
         sizeEnd: Float,
         sizeVariation: Float,
         lifetime: Float) {
        self.init(type: type,
                  position: position,
                  direction: direction.direction,
                  directionVariation: directionVariation.radians,
                  velocity: velocity,
                  velocityVariation: velocityVariation,
                  rotationSpeed: rotationSpeed.radians,
                  rotationSpeedVariation: rotationSpeedVariation.radians,
                  colorStart: colorStart,
                  colorEnd: colorEnd,
                  sizeStart: sizeStart,
                  sizeEnd: sizeEnd,
                  sizeVariation: sizeVariation,
                  lifetime: lifetime)
        self.position = position
        self.direction = direction.direction
        self.directionVariation = directionVariation.radians
        self.velocity = velocity
        self.velocityVariation = velocityVariation
        self.rotationSpeed = rotationSpeed.radians
        self.rotationSpeedVariation = rotationSpeedVariation.radians
        self.colorStart = colorStart
        self.colorEnd = colorEnd
        self.sizeStart = sizeStart
        self.sizeEnd = sizeEnd
        self.sizeVariation = sizeVariation
        self.lifetime = lifetime
    }
}
