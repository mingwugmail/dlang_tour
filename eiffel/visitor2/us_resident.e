class US_RESIDENT
inherit PERSON
  -- rename make as init_person
  -- redefine addr
  redefine make
end

feature {ANY}
   make is
     do
       Precursor
     end
end
