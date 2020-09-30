-- to build: compile  app.e -o app
class APP

create {ANY}
   main

feature {ANY}
   visitor: VISITOR
   bank: BANK
   doctor: DOCTOR

   print_uk_addr(u: VISITOR) is do io.put_string("US addr: " + u.uk_addr + "%N") end
   print_us_addr(u: VISITOR) is do io.put_string("UK addr: " + u.us_addr + "%N") end

   main is
      do
	 create bank.make
	 create doctor.make
	 create visitor.make

         io.put_string(visitor.name + "%N")
         io.put_string(visitor.addr + "%N")
	 print_uk_addr(visitor)
	 print_us_addr(visitor)

	 bank.read_bank_acct(visitor)
	 doctor.read_health_info(visitor)
      end

end
