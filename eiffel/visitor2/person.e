class PERSON

create {ANY}
   make

feature {ANY}
   name: STRING
   addr: STRING

   make is
     do
       name := "A person have only *one* name"
       addr := "A person can have *multi* addr"
       -- io.put_string("PERSON.make:" + name +" "+ addr + "%N")
     end

feature {BANK}
   bank_acct: STRING is do Result := "bank_acct: only view-able by bank" end

feature {DOCTOR}
   health_info: STRING is do Result := "health_info: only view-able by doctor" end

end
