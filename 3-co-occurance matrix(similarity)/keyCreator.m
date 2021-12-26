function out = keyCreator(x)
x=sort(x);
combx=nchoosek(x,2);

out = {combx};

end