class BANK

create {ANY}
   make

feature
  make is do end

  read_bank_acct(u: PERSON) is
    do
      io.put_string(u.bank_acct    + "%N")
    --io.put_string(u.health_info  + "%N") -- ****** Fatal Error: This feature is only exported to {DOCTOR}.
    end
end
