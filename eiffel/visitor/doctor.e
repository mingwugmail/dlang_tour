class DOCTOR

create {ANY}
   make

feature
  make is do end

  read_health_info(u: PERSON) is
    do
    --io.put_string(u.bank_acct    + "%N") -- ****** Fatal Error: This feature is only exported to {BANK}.
      io.put_string(u.health_info  + "%N")
    end
end
