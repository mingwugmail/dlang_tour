class VISITOR
inherit
	UK_RESIDENT
		rename addr as uk_addr
		       make as uk_make
	end
	US_RESIDENT
		rename addr as us_addr
		       make as us_make
	end
	PERSON
		-- redefine addr select addr
		redefine make select make
	end

create {ANY}
   make

feature {ANY}
   make is
     do
       uk_make
       us_make
       addr := "My hotel in Paris"
       uk_addr := "London"
       us_addr := "NewYork"
     end

end
