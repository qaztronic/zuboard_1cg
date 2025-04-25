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
  localparam A = 16;
  localparam N = 4;

  axi4_if #(A,N) axi4_cpu(.*);

  // --------------------------------------------------------------------------------
  wire aclk   ;
  wire aresetn;

  base_cpu_w cpu_i(.*);

  // --------------------------------------------------------------------------------
  axi4_lite_default_slave #(A, N)
    axi4_lite_default_slave(.axi4_s(axi4_cpu), .*);

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
endmodule
