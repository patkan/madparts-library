#format 1.2
#name NRS8030
#id 6459566401fa4f3da6830eac7d738cc4
#desc Taiyo Yuden inductor NRS8030

footprint = () ->
  
  pad_length = 1.8
  pad_width = 7.5
  pad_dist = 5.6

  body_width = 8
  body_length = 9

  line_width = 0.1

  pad = new Smd
  pad.dx = pad_length
  pad .dy = pad_width
  #pad.ro = 10
  
  p1 = single pad, 1, 0
  p1 = adjust_x p1, -pad_dist/2
  p2 = single pad, 1, 0
  p2 = adjust_x p2, pad_dist/2
  p2 = generate_names p2, 1

  r1 = make_rect body_length, body_width, line_width, 'silk'

  name = new Name (2*body_width/3)
  value = new Value (-2*body_width/3)


  combine [name, value, p1, p2, r1]