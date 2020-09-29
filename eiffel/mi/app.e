-- to build: compile  app.e -o app
class APP

create {ANY}
   main

feature {ANY}

   usr: US_RESIDENT

   print_addr(p: PERSON) is do
      io.put_string(p.addr + "%N")
   end

   main is
      do
	 create usr.make
	 print_addr(usr)
      end

end
