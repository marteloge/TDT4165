declare
fun{Length Xs}
   case Xs of H|T then
      1 + {Length T}
   [] nil then
      0
   end
end

fun{Take Xs N}
   case Xs of H|T then
      if N >= {Length Xs} then
	 Xs
      else
	 if N \= 0 then
	    H|{Take T N-1}
	 else
	    nil
	 end
      end
   []nil then nil
   end
end

fun{Drop Xs N}
   case Xs of H|T then
      if N >= {Length Xs} then
	 nil
      else
	 if N > 1 then
	    {Drop T N-1}
	 else
	    T
	 end
      end
   []nil then nil
   end
end

fun{Append Xs Ys}
   case Xs of H|T then
      H|{Append T Ys}  % Husk! [1]|[2 3] gir [[1] 2 3], men 1|[2 3] gir [1 2 3]
   []nil then Ys
   end
end

fun{Member Xs Z}
   case Xs of H|T then
      if H == Z then
	 true
      else
	 {Member T Z}
      end
   [] nil then
      false
   end
end

fun{Position Xs Y}
   case Xs of H|T then
      if H \= Y then
	 1 + {Position T Y}
      else
	 1
      end
   [] nil then false
   end
end