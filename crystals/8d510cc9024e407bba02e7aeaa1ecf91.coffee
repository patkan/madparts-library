#format 1.2
#name crystal_SMD_CPFB
#id 8d510cc9024e407bba02e7aeaa1ecf91
#desc crystal CPFB series by Cardinal Components
#desc Digikey partnumber 370-1056-1-ND

footprint = () ->
  
  pad_length = 1.9
  pad_width = 1.3
  pad_dist_y = 1.3 + pad_length
  pad_dist_x = 4.2 + pad_width
  
  body_length = 8.7
  half_body_length = body_length/2
  body_width = 3.7

  line_width = 0.1

  pad = new Smd
  pad.dx = pad_width
  pad .dy = pad_length
  #pad.ro = 10
  
  # this diverges intentionally from the the recommended pad layout
  # when exported to kicad this will fit to the standard crystal-symbol
  pads = dual [pad], 4, pad_dist_y, pad_dist_x
  

  marker_thickness = 0.07
  r1 = make_rect body_length, body_width, line_width, 'silk'
  marker_length = marker_thickness * body_length
  r2 = make_rect marker_length, body_width, line_width, 'silk'
  marker_x_adjust = -half_body_length + marker_thickness * half_body_length
  r2 = adjust_x r2, marker_x_adjust

  name = new Name (body_width)
  value = new Value (-body_width)


  combine [name, value, pads, r1, r2]