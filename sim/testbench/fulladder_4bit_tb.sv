module fulladder_4bit_tb;

    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    reg  [3:0] exp_sum;
    reg        exp_cout;

    integer pass_count = 0;
    integer fail_count = 0;

    // DUT
    fulladder_4bit dut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Generate waveform
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, fulladder_4bit_tb);
    end

    // Clean stimulus loop
    initial begin
        repeat (200) begin
            apply_stimulus();

            // Wait for DUT to compute
            #1;

            // Compare expected vs DUT
            if ({exp_cout, exp_sum} == {Cout, Sum})
                pass_count++;
            else
                fail_count++;
        end

        // Final summary only
        $display("=======================================");
        $display("Total Test Cases Passed = %0d", pass_count);
        $display("Total Test Cases Failed = %0d", fail_count);
        $display("=======================================");

        #2 $finish;
    end

    // Task: Apply stimulus
    task apply_stimulus;
        reg [3:0] a, b;
        reg       cin;
        begin
            a   = $random;
            b   = $random;
            cin = $random;

            A   = a;
            B   = b;
            Cin = cin;

            {exp_cout, exp_sum} = a + b + cin;
        end
    endtask

endmodule
