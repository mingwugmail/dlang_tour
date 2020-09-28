class UK_RESIDENT
inherit PERSON redefine addr end
feature {ANY}
   addr: STRING is do Result := "London" end
end
