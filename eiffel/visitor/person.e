class PERSON

feature {ANY}
   name: STRING is do Result := "A person have only *one* name"  end
   addr: STRING is do Result := "A person can have *multi*.addr" end

feature {BANK}
   bank_acct: STRING is do Result := "bank_acct: only view-able by bank" end

feature {DOCTOR}
   health_info: STRING is do Result := "health_info: only view-able by doctor" end

end
