import Box2D 2.0

/*
  This body places 32-pixel wide invisible static bodies around the window,
  to avoid stuff getting out.
*/
Body {
    world: physicsWorld

    Box {
        y: window.height
        width: window.width
        height: 32
    }
    Box {
        y: -32
        height: 32
        width: window.width
    }
    Box {
        x: -32
        width: 32
        height: window.height
    }
    Box {
        x: window.width
        width: 32
        height: window.height
    }
}
