-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Home Dell 4K
hl.monitor({
    output   = "desc:Dell Inc. DELL S2722QC 4CQWH24",
    mode     = "preferred",
    position = "auto-center-left",
    scale    = 1.5,
})

-- ISS
-- Primary
hl.monitor({
    output   = "desc:LG Electronics LG HDR 4K 0x00043BAE",
    mode     = "3840x2160@60",
    position = "0x0",
    scale    = 1.5,
})
-- hl.monitor({ output = "desc:LG Electronics LG HDR 4K 0x00043BAE", mode = "2560x1440", position = "0x0", scale = 1.0 })

hl.monitor({
    output   = "desc:Dell Inc. DELL U2422HE BBPVNM3",
    mode     = "preferred",
    position = "auto-center-left",
    scale    = 1.0,
})

hl.monitor({
    output   = "desc:Samsung Electric Company LF24T450G HNMX401255",
    mode     = "preferred",
    position = "auto-center-left",
    scale    = 1.0,
})

-- Lecture
hl.monitor({
    output   = "desc:Crestron Electronics Inc. Crestron",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
    mirror   = "eDP-1",
})

hl.monitor({
    output   = "desc:Seiko Epson Corporation EPSON PJ 0x01010101",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
    mirror   = "eDP-1",
})

-- Built-In
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto-center-right",
    scale    = 1.0,
})

-- Fallback for anything not matched above
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto-center-left",
    scale    = 1,
})
