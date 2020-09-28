class VISITOR
inherit
	UK_RESIDENT rename addr as uk_addr end
	US_RESIDENT rename addr as us_addr end
	PERSON      redefine addr select addr end

create {ANY}
   make

feature {ANY}
   make is do end

   addr: STRING is
      do
	 Result := "My hotel in Paris"
      end
end
