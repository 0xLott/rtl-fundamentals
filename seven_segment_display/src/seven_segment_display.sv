//  0   =   a  b  c  d  e  f      =  1111110     
//  1   =      b  c               =  0110000
//  2   =   a  b     d  e     g   =  1101101     
//  3   =   a  b  c  d        g   =  1111001
//  4   =      b  c        f  g   =  0110011
//  5   =   a     c  d     f  g   =  1011011
//  6   =   a     c  d  e  f  g   =  1011111
//  7   =   a  b  c               =  1110000
//  8   =   a  b  c  d  e  f  g   =  1111111
//  9   =   a  b  c  d     f  g   =  1111011
//  E   =   a        d  e  f  g   =  1111001

module seven_segment_display (
    input   logic   [3:0] number,
    output  logic   [6:0] signal    // 7-bit vector: {a,b,c,d,e,f,g}
);

    // An array of 10 elements, each of which is a 7-bit vector. Order: {a,b,c,d,e,f,g}, where 1 = ON, 0 = OFF
    localparam logic [6:0] look_up_table [0:9] = '{
        7'b1111110,  // 0
        7'b0110000,  // 1
        7'b1101101,  // 2
        7'b1111001,  // 3
        7'b0110011,  // 4
        7'b1011011,  // 5
        7'b1011111,  // 6
        7'b1110000,  // 7
        7'b1111111,  // 8
        7'b1111011   // 9
    };  

    always_comb begin
        if (number <= 9)
            signal = look_up_table[number];
        else
            signal = 7'b1111001;    // = E = Error state
    end

endmodule