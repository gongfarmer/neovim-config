-- debug printing of a lua objects
function p(...)
  if #{ ... } > 1 then
    print(vim.inspect({ ... }))
  else
    print(vim.inspect(...))
  end
end

-- return true if file exists and is readable
function file_exists(name)
  local f=io.open(name,"r")
  if f~=nil then io.close(f) return true else return false end
end

-- return the path to the dir containing this source file (NOT the current working dir)
function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end
