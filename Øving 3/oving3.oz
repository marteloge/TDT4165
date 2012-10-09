% OOpave 3a
% Slå sammen to lister
local Append in
   Append = proc {$ Xs Ys ?R}% markerer outputargumentet med ?
	       case Xs of nil then
		  R = Ys
	       else
		  case Xs of '|'(X Xr) then
		     local Rr in
			R = '|'(X Rr) {Append Xr Ys Rr}
		     end
		  else
		     skip
		  end
	       end
	    end
end
{Browse {Append [1 2] [4 5]}}



% Oppgave 3b
% finnes største tall
local Max in
    Max = proc {$ N M ?R}
	     local Nzero in
		{Value.'==' N 0 Nzero}
		if Nzero then
		   R = M
		else
		   local Mzero in
		      {Value.'==' M 0 Mzero}
		      if Mzero then
			    R = N
		      else
			 local N2 in
			    local M2 in
			       local R2 in
				  local Sum in
				     {Number.'-' N 1 N2}
				     {Number.'-' M 1 M2}
				     {Number.'+' 1 R2 Sum}
				  end
			       end
			    end
			 end
		      end
		   end
		end
	     end
	  end
end

{Browse {Max 12 6}}