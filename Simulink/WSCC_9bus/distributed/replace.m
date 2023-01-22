function replace( subsystem, field, value, parameter, old, new )
    handle = get_param(subsystem, 'Handle');
    
    blocks = find_system(handle, field, value);
    
    for idx = 1:numel(blocks)
        block = blocks(idx);
        
        val = get_param(block, parameter);
        newval = strrep(val, old, new);
        set_param(block, parameter, newval);
    end
end

