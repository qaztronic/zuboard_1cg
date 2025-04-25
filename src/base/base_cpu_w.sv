// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------

module base_cpu_w
( output aclk
, output aresetn
// , axi4_if axi4_cpu
);
  // --------------------------------------------------------------------------------
  // wire        M_AXI_0_arready = axi4_cpu.arready;
  // wire        M_AXI_0_awready = axi4_cpu.awready;
  // wire        M_AXI_0_bvalid  = axi4_cpu.bvalid ;
  // wire        M_AXI_0_rvalid  = axi4_cpu.rvalid ;
  // wire        M_AXI_0_wready  = axi4_cpu.wready ;
  // wire [ 1:0] M_AXI_0_bresp   = axi4_cpu.bresp  ;
  // wire [1:0]  M_AXI_0_rresp   = axi4_cpu.rresp  ;
  // wire [31:0] M_AXI_0_rdata   = axi4_cpu.rdata  ;
  
  wire        M_AXI_0_arready = 1;
  wire        M_AXI_0_awready = 1;
  wire        M_AXI_0_bvalid  = 0;
  wire        M_AXI_0_rvalid  = 0;
  wire        M_AXI_0_wready  = 1;
  wire [ 1:0] M_AXI_0_bresp   = 0;
  wire [1:0]  M_AXI_0_rresp   = 0;
  wire [31:0] M_AXI_0_rdata   = 0;
  
  // --------------------------------------------------------------------------------
  wire        M_AXI_0_arvalid;
  wire        M_AXI_0_awvalid;
  wire        M_AXI_0_bready ;
  wire        M_AXI_0_rready ;
  wire        M_AXI_0_wvalid ;
  wire [ 2:0] M_AXI_0_arprot ;
  wire [ 2:0] M_AXI_0_awprot ;
  wire [ 3:0] M_AXI_0_wstrb  ;
  wire [31:0] M_AXI_0_wdata  ;
  wire [39:0] M_AXI_0_araddr ;
  wire [39:0] M_AXI_0_awaddr ;
  
  // assign axi4_cpu.arvalid = M_AXI_0_arvalid;
  // assign axi4_cpu.awvalid = M_AXI_0_awvalid;
  // assign axi4_cpu.bready  = M_AXI_0_bready ;
  // assign axi4_cpu.rready  = M_AXI_0_rready ;
  // assign axi4_cpu.wvalid  = M_AXI_0_wvalid ;
  // assign axi4_cpu.arprot  = M_AXI_0_arprot ;
  // assign axi4_cpu.awprot  = M_AXI_0_awprot ;
  // assign axi4_cpu.wstrb   = M_AXI_0_wstrb  ;
  // assign axi4_cpu.wdata   = M_AXI_0_wdata  ;
  // assign axi4_cpu.araddr  = M_AXI_0_araddr ;
  // assign axi4_cpu.awaddr  = M_AXI_0_awaddr ;

  // --------------------------------------------------------------------------------
  base_cpu cpu_i(.*);

// --------------------------------------------------------------------------------
endmodule
