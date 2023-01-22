function prefix( subsystem, field, value, parameter, prefix )
    handle = get_param(subsystem, 'Handle');
    
    blocks = find_system(handle, field, value);
    
    for idx = 1:numel(blocks)
        block = blocks(idx);
        
        val = get_param(block, parameter);
        newval = strcat(prefix, val);
        
        if numel(strfind(val, prefix)) == 0
            set_param(block, parameter, newval);
        end
    end
end

