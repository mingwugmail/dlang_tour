class US_RESIDENT
inherit PERSON
  undefine addr
end

create {ANY}
   make

feature {ANY}
   make is do end

-- addr: STRING is do Result := "NewYork" end

end
