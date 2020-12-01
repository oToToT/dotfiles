source ~/.gdb/pwngdb/pwngdb.py
source ~/.gdb/pwngdb/angelheap/gdbinit.py
source ~/.gdb/gef.py

define hook-run
python
import angelheap
angelheap.init_angelheap()
end
end

#python import angrgdb.commands
