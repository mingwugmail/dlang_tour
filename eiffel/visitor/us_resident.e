class US_RESIDENT
inherit PERSON redefine addr end
feature {ANY}
   addr: STRING is do Result := "NewYork" end
end
