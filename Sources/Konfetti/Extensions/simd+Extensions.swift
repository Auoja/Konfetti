//   __  __     ______     __   __     ______   ______     ______   ______   __
//  /\ \/ /    /\  __ \   /\ "-.\ \   /\  ___\ /\  ___\   /\__  _\ /\__  _\ /\ \
//  \ \  _"-.  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \  __\   \/_/\ \/ \/_/\ \/ \ \ \
//   \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_____\    \ \_\    \ \_\  \ \_\
//    \/_/\/_/   \/_____/   \/_/ \/_/   \/_/     \/_____/     \/_/     \/_/   \/_/
//

import simd

extension vector_float2 {

    func rotate(angle: Float) -> vector_float2 {
        self * float2x2.rotation(angle: angle)
    }
}

extension float2x2 {

    static func identity() -> float2x2 {
        matrix_identity_float2x2
    }

    static func rotation(angle: Float) -> float2x2 {
        let c = cos(angle)
        let s = sin(angle)

        var matrix = float2x2.identity()
        matrix[0, 0] = c
        matrix[1, 0] = -s
        matrix[0, 1] = s
        matrix[1, 1] = c
        return matrix
    }
}
