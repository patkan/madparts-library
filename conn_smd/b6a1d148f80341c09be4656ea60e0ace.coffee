#format 1.2
#name CORTEX_header_SMD
#id b6a1d148f80341c09be4656ea60e0ace
#desc ARM CORTEX Debug Header in SMD (10 pins, 2x5)
#desc Digikey partnumber: 1175-1629-ND

footprint = () ->
  
  pad_length = 1.5
  pad_width = 0.76
  pad_dist_y = 1.27
  
  width = 6.3
  pad_dist_x = width - pad_length

  body_width = 5.1
  body_length = 11.25

  line_width = 0.1

  pad = new Smd
  pad.dx = pad_length
  pad .dy = pad_width
  #pad.ro = 10
  
  pads = alt_dual [pad], 10, pad_dist_y, pad_dist_x
  p1 = single pad, 5, pad_dist_y
  p1 = adjust_x p1, -pad_dist_x/2
  p2 = single pad, 1, 0
  p2 = adjust_x p2, pad_dist_x/2
  p2 = generate_names p2, 1

  r1 = make_rect body_width, body_length, line_width, 'silk'
  r2 = make_rect 1.1*pad_length, 2*pad_width, line_width, 'silk'
  r2 = adjust_x r2, -pad_dist_x/2

  name = new Name (body_width)
  value = new Value (-body_width)


  combine [name, value, pads, r1, r2]