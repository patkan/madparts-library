#format 1.2
#name PLCC-4
#id 95d697b33e684420b8674b8743f66bbb
#desc LED Cree CLVBA-FKA

footprint = () ->
  

  pad_length = 1.4
  pad_width = 1.1
  
  width = 2.7
  length = 4.4

  body_width = 2.8
  body_length = 3.2

  line_width = 0.25
  fine_line_width = line_width / 3

  name = new Name (width)
  value = new Value (-width)

  pad = new Smd
  pad.dx = pad_length
  pad.dy = pad_width
  pad.ro = 10

  pad_dist_y = width - pad_width
  pad_dist_x = (length - pad_length)/2
 
  padsl = single pad, 2, pad_dist_y
  padsl = adjust_x padsl, -pad_dist_x
  padsr = single pad, 2, pad_dist_y
  padsr = adjust_x padsr, pad_dist_x
  padsr = reverse padsr
  padsr = generate_names padsr, 2
  

  r1 = make_rect body_length, body_width, line_width, 'docu'
  r2 = make_rect length+2 * fine_line_width, width + 2* fine_line_width, fine_line_width, 'silk'
  c1 = new Circle line_width
  c1.type = 'docu'
  c1.r = 1

  # make pad 1 round
  padsl[1-1].ro = 60

  # draw a little dot near pin 1
  dot = new Disc line_width
  dot.type = 'docu'
  dot.x = -body_length/2 + body_length/6
  dot.y = body_width/2 - body_width/7
 

  combine [name, value, r1, r2,  c1, padsl, padsr, dot]