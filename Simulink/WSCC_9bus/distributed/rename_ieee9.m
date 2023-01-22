function rename_ieee9(ss, i)
        n = sprintf('ss%i_', i);
        m = sprintf('SS%i', i);

        set_param(ss, 'Name', m);
        
        prefix(ss, 'BlockType', 'Goto', 'GotoTag', n);        
        prefix(ss, 'MaskType', 'Three-Phase VI Measurement', 'LabelI', n);
        prefix(ss, 'MaskType', 'Three-Phase VI Measurement', 'LabelV', n);
        
        prefix(ss, 'MaskType', 'Load Flow Bus', 'ID', n);
        
        replace(ss, 'BlockType', 'Scope', 'Name', n, '');
        prefix(ss,  'BlockType', 'Scope', 'DataLoggingVariableName', n);
end