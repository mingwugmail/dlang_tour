-- to build: compile  app.e -o app
class APP

create {ANY}
   main

feature {ANY}

   usr: US_RESIDENT

   main is
      do
	 create usr.make
      -- io.put_string(usr.addr + "%N")
      end

end
