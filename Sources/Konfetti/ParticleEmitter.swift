//   __  __     ______     __   __     ______   ______     ______   ______   __
//  /\ \/ /    /\  __ \   /\ "-.\ \   /\  ___\ /\  ___\   /\__  _\ /\__  _\ /\ \
//  \ \  _"-.  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \  __\   \/_/\ \/ \/_/\ \/ \ \ \
//   \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_____\    \ \_\    \ \_\  \ \_\
//    \/_/\/_/   \/_____/   \/_/ \/_/   \/_/     \/_____/     \/_/     \/_/   \/_/
//

import simd

// MARK: - ParticleEmitter

public class ParticleEmitter {

    private var pool: [Particle]
    private var poolIndex: Int = 0

    public init(size: Int = 1000) {
        pool = Array(repeating: Particle(), count: 1000)
    }
}

// MARK: Public

public extension ParticleEmitter {

    var particles: [Particle] {
        pool.filter(\.isActive)
    }

    func update(ts: Float) {
        for i in pool.indices {
            guard pool[i].isActive else { continue }

            if pool[i].lifeRemaining <= 0 {
                pool[i].isActive = false
                continue
            }

            pool[i].lifeRemaining -= ts
            pool[i].position += pool[i].velocity * ts
            pool[i].rotation += pool[i].rotationVelocity * ts
        }
    }

    func render(_ draw: ((Particle) -> Void)) {
        for particle in particles where particle.isActive {
            draw(particle)
        }
    }

    func emitParticle(_ template: ParticleTemplate) {
        var particle = pool[poolIndex]
        particle.isActive = true

        particle.type = template.type

        particle.position = template.position

        let magnitude = template.velocity + template.velocityVariation * (0.5 - Float.random)
        let angle = template.directionVariation * (0.5 - Float.random)
        particle.velocity = template.direction.rotate(angle: angle) * magnitude

        particle.rotation = template.rotationSpeed * (Float.random * .pi * 2.0)
        particle.rotationVelocity = template.rotationSpeed + template.rotationSpeedVariation * (0.5 - Float.random)

        particle.colorStart = template.colorStart
        particle.colorEnd = template.colorEnd

        particle.sizeStart = template.sizeStart + template.sizeVariation * (Float.random - 0.5)
        particle.sizeEnd = template.sizeEnd

        particle.lifetime = template.lifetime
        particle.lifeRemaining = template.lifetime

        pool[poolIndex] = particle

        poolIndex += 1
        poolIndex %= pool.count
    }
}

// MARK: Convenience

public extension ParticleEmitter {

    func emitParticles(_ properties: ParticleTemplate, count: Int) {
        (0 ..< count).forEach { _ in emitParticle(properties) }
    }
}
