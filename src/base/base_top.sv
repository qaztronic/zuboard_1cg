// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------

module base_top
( output HD_GPIO_RGB1_B
, output HD_GPIO_RGB1_G
, output HD_GPIO_RGB1_R
, output HP_GPIO_RGB2_B
, output HP_GPIO_RGB2_G
, output HP_GPIO_RGB2_R
);
  // --------------------------------------------------------------------------------
  localparam A  = 16;
  localparam N  =  4;
  localparam I  =  1;
  localparam MW =  4;

  axi4_if #(A,N) axi4_cpu(.*);

  // --------------------------------------------------------------------------------
  wire aclk   ;
  wire aresetn;

  base_cpu_w cpu_i(.*);

  // --------------------------------------------------------------------------------
  axi4_if #(A,N) axi4_m[2](.*);

  axi4_lite_fanout #(A, N, 'h1000)
   axi4_lite_fanout_i (.axi4_s(axi4_cpu), .*);

  // --------------------------------------------------------------------------------
  axi4_lite_register_if #(N, MW) r_if();

  axi4_lite_register_file #(A, N, I, MW)
    axi4_lite_register_file_i(.axi4_s(axi4_m[0]), .*);

  // // --------------------------------------------------------------------------------
  // axi4_lite_default_slave #(A, N)
    // axi4_lite_default_slave_0(.axi4_s(axi4_m[0]), .*);

  // --------------------------------------------------------------------------------
  axi4_lite_default_slave #(A, N)
    axi4_lite_default_slave_1(.axi4_s(axi4_m[1]), .*);

  // --------------------------------------------------------------------------------
  reg [25:0] counter;

  always_ff @(posedge aclk)
    counter <= counter + 1;

  // --------------------------------------------------------------------------------
  assign HD_GPIO_RGB1_B = 0;
  assign HD_GPIO_RGB1_G = counter[25];
  assign HD_GPIO_RGB1_R = 0;
  assign HP_GPIO_RGB2_B = 0;
  assign HP_GPIO_RGB2_G = 0;
  assign HP_GPIO_RGB2_R = 0;

  // --------------------------------------------------------------------------------
  assign r_if.register_in[14: 0] = '{default: '0};
  assign r_if.register_in[   15] = 'hb16b00b5;

// --------------------------------------------------------------------------------
endmodule
