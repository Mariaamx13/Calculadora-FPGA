using System.IO.Ports;

namespace Calculadora
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            Titulo = new Panel();
            btnmin = new Button();
            btnExit = new Button();
            pnlhistorial = new Panel();
            richTextBox1 = new RichTextBox();
            textOp = new TextBox();
            txtresp = new TextBox();
            flowLayoutPanel1 = new FlowLayoutPanel();
            btnsum = new Button();
            btnrest = new Button();
            btndiv = new Button();
            btnmult = new Button();
            button5 = new Button();
            btnpartialclear = new Button();
            btnclear = new Button();
            btnerase = new Button();
            btn6 = new Button();
            btn7 = new Button();
            btn8 = new Button();
            btn9 = new Button();
            btn2 = new Button();
            btn3 = new Button();
            btn4 = new Button();
            btn5 = new Button();
            btn0 = new Button();
            btn1 = new Button();
            btnresultado = new Button();
            timer1 = new System.Windows.Forms.Timer(components);
            Titulo.SuspendLayout();
            pnlhistorial.SuspendLayout();
            flowLayoutPanel1.SuspendLayout();
            SuspendLayout();
            // 
            // Titulo
            // 
            Titulo.Controls.Add(btnmin);
            Titulo.Controls.Add(btnExit);
            Titulo.Dock = DockStyle.Top;
            Titulo.Location = new Point(0, 0);
            Titulo.Margin = new Padding(0);
            Titulo.Name = "Titulo";
            Titulo.Size = new Size(597, 70);
            Titulo.TabIndex = 0;
            // 
            // btnmin
            // 
            btnmin.Dock = DockStyle.Right;
            btnmin.FlatAppearance.BorderSize = 0;
            btnmin.FlatAppearance.MouseOverBackColor = Color.Red;
            btnmin.FlatStyle = FlatStyle.Flat;
            btnmin.Image = (Image)resources.GetObject("btnmin.Image");
            btnmin.Location = new Point(418, 0);
            btnmin.Margin = new Padding(0);
            btnmin.Name = "btnmin";
            btnmin.Size = new Size(87, 70);
            btnmin.TabIndex = 1;
            btnmin.UseVisualStyleBackColor = true;
            btnmin.Click += btnmin_Click;
            // 
            // btnExit
            // 
            btnExit.Dock = DockStyle.Right;
            btnExit.FlatAppearance.BorderSize = 0;
            btnExit.FlatAppearance.MouseOverBackColor = Color.Red;
            btnExit.FlatStyle = FlatStyle.Flat;
            btnExit.Image = (Image)resources.GetObject("btnExit.Image");
            btnExit.Location = new Point(505, 0);
            btnExit.Margin = new Padding(0);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(92, 70);
            btnExit.TabIndex = 0;
            btnExit.UseVisualStyleBackColor = true;
            btnExit.Click += btnExit_Click;
            // 
            // pnlhistorial
            // 
            pnlhistorial.Controls.Add(richTextBox1);
            pnlhistorial.Dock = DockStyle.Bottom;
            pnlhistorial.Location = new Point(0, 953);
            pnlhistorial.Margin = new Padding(0);
            pnlhistorial.Name = "pnlhistorial";
            pnlhistorial.Size = new Size(597, 10);
            pnlhistorial.TabIndex = 1;
            // 
            // richTextBox1
            // 
            richTextBox1.BackColor = Color.FromArgb(32, 32, 32);
            richTextBox1.BorderStyle = BorderStyle.None;
            richTextBox1.Dock = DockStyle.Fill;
            richTextBox1.ForeColor = Color.LightGray;
            richTextBox1.Location = new Point(0, 0);
            richTextBox1.Margin = new Padding(0);
            richTextBox1.Name = "richTextBox1";
            richTextBox1.ScrollBars = RichTextBoxScrollBars.Horizontal;
            richTextBox1.Size = new Size(597, 10);
            richTextBox1.TabIndex = 0;
            richTextBox1.Text = "";
            // 
            // textOp
            // 
            textOp.BackColor = Color.FromArgb(32, 32, 32);
            textOp.BorderStyle = BorderStyle.None;
            textOp.Dock = DockStyle.Top;
            textOp.Font = new Font("Gadugi", 18F, FontStyle.Regular, GraphicsUnit.Point);
            textOp.ForeColor = Color.LightGray;
            textOp.Location = new Point(0, 70);
            textOp.Margin = new Padding(0);
            textOp.Multiline = true;
            textOp.Name = "textOp";
            textOp.ReadOnly = true;
            textOp.Size = new Size(597, 77);
            textOp.TabIndex = 3;
            textOp.TextAlign = HorizontalAlignment.Right;
            textOp.Click += btn_op;
            // 
            // txtresp
            // 
            txtresp.BackColor = Color.FromArgb(32, 32, 32);
            txtresp.BorderStyle = BorderStyle.None;
            txtresp.Dock = DockStyle.Top;
            txtresp.Font = new Font("Gadugi", 26.25F, FontStyle.Bold, GraphicsUnit.Point);
            txtresp.ForeColor = Color.LightGray;
            txtresp.Location = new Point(0, 147);
            txtresp.Margin = new Padding(0);
            txtresp.Multiline = true;
            txtresp.Name = "txtresp";
            txtresp.ReadOnly = true;
            txtresp.Size = new Size(597, 99);
            txtresp.TabIndex = 4;
            txtresp.Text = "0";
            txtresp.TextAlign = HorizontalAlignment.Right;
            // 
            // flowLayoutPanel1
            // 
            flowLayoutPanel1.Controls.Add(btnsum);
            flowLayoutPanel1.Controls.Add(btnrest);
            flowLayoutPanel1.Controls.Add(btndiv);
            flowLayoutPanel1.Controls.Add(btnmult);
            flowLayoutPanel1.Controls.Add(button5);
            flowLayoutPanel1.Controls.Add(btnpartialclear);
            flowLayoutPanel1.Controls.Add(btnclear);
            flowLayoutPanel1.Controls.Add(btnerase);
            flowLayoutPanel1.Controls.Add(btn6);
            flowLayoutPanel1.Controls.Add(btn7);
            flowLayoutPanel1.Controls.Add(btn8);
            flowLayoutPanel1.Controls.Add(btn9);
            flowLayoutPanel1.Controls.Add(btn2);
            flowLayoutPanel1.Controls.Add(btn3);
            flowLayoutPanel1.Controls.Add(btn4);
            flowLayoutPanel1.Controls.Add(btn5);
            flowLayoutPanel1.Controls.Add(btn0);
            flowLayoutPanel1.Controls.Add(btn1);
            flowLayoutPanel1.Controls.Add(btnresultado);
            flowLayoutPanel1.Dock = DockStyle.Fill;
            flowLayoutPanel1.Location = new Point(0, 246);
            flowLayoutPanel1.Name = "flowLayoutPanel1";
            flowLayoutPanel1.Size = new Size(597, 707);
            flowLayoutPanel1.TabIndex = 5;
            // 
            // btnsum
            // 
            btnsum.BackColor = Color.FromArgb(44, 44, 44);
            btnsum.FlatAppearance.BorderSize = 0;
            btnsum.FlatStyle = FlatStyle.Flat;
            btnsum.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnsum.ForeColor = Color.White;
            btnsum.Location = new Point(3, 3);
            btnsum.Name = "btnsum";
            btnsum.Size = new Size(142, 136);
            btnsum.TabIndex = 1;
            btnsum.Text = "+";
            btnsum.UseVisualStyleBackColor = false;
            btnsum.Click += btn_op;
            // 
            // btnrest
            // 
            btnrest.BackColor = Color.FromArgb(44, 44, 44);
            btnrest.FlatAppearance.BorderSize = 0;
            btnrest.FlatStyle = FlatStyle.Flat;
            btnrest.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnrest.ForeColor = Color.White;
            btnrest.Location = new Point(151, 3);
            btnrest.Name = "btnrest";
            btnrest.Size = new Size(141, 136);
            btnrest.TabIndex = 2;
            btnrest.Text = "-";
            btnrest.UseVisualStyleBackColor = false;
            btnrest.Click += btn_op;
            // 
            // btndiv
            // 
            btndiv.BackColor = Color.FromArgb(44, 44, 44);
            btndiv.FlatAppearance.BorderSize = 0;
            btndiv.FlatStyle = FlatStyle.Flat;
            btndiv.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btndiv.ForeColor = Color.White;
            btndiv.Location = new Point(298, 3);
            btndiv.Name = "btndiv";
            btndiv.Size = new Size(141, 136);
            btndiv.TabIndex = 3;
            btndiv.Text = "÷";
            btndiv.UseVisualStyleBackColor = false;
            btndiv.Click += btn_op;
            // 
            // btnmult
            // 
            btnmult.BackColor = Color.FromArgb(44, 44, 44);
            btnmult.FlatAppearance.BorderSize = 0;
            btnmult.FlatStyle = FlatStyle.Flat;
            btnmult.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnmult.ForeColor = Color.White;
            btnmult.Location = new Point(445, 3);
            btnmult.Name = "btnmult";
            btnmult.Size = new Size(141, 136);
            btnmult.TabIndex = 4;
            btnmult.Text = "×";
            btnmult.UseVisualStyleBackColor = false;
            btnmult.Click += btn_op;
            // 
            // button5
            // 
            button5.BackColor = Color.FromArgb(32, 32, 32);
            button5.FlatAppearance.BorderSize = 0;
            button5.FlatStyle = FlatStyle.Flat;
            button5.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            button5.ForeColor = Color.White;
            button5.Location = new Point(3, 145);
            button5.Name = "button5";
            button5.Size = new Size(141, 136);
            button5.TabIndex = 5;
            button5.UseVisualStyleBackColor = false;
            // 
            // btnpartialclear
            // 
            btnpartialclear.BackColor = Color.FromArgb(44, 44, 44);
            btnpartialclear.FlatAppearance.BorderSize = 0;
            btnpartialclear.FlatStyle = FlatStyle.Flat;
            btnpartialclear.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnpartialclear.ForeColor = Color.White;
            btnpartialclear.Location = new Point(150, 145);
            btnpartialclear.Name = "btnpartialclear";
            btnpartialclear.Size = new Size(141, 136);
            btnpartialclear.TabIndex = 6;
            btnpartialclear.Text = "CE";
            btnpartialclear.UseVisualStyleBackColor = false;
            btnpartialclear.Click += btnpartialclear_Click;
            // 
            // btnclear
            // 
            btnclear.BackColor = Color.FromArgb(44, 44, 44);
            btnclear.FlatAppearance.BorderSize = 0;
            btnclear.FlatStyle = FlatStyle.Flat;
            btnclear.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnclear.ForeColor = Color.White;
            btnclear.Location = new Point(297, 145);
            btnclear.Name = "btnclear";
            btnclear.Size = new Size(141, 136);
            btnclear.TabIndex = 7;
            btnclear.Text = "C";
            btnclear.UseVisualStyleBackColor = false;
            btnclear.Click += btnclear_Click;
            // 
            // btnerase
            // 
            btnerase.BackColor = Color.FromArgb(44, 44, 44);
            btnerase.FlatAppearance.BorderSize = 0;
            btnerase.FlatStyle = FlatStyle.Flat;
            btnerase.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnerase.ForeColor = Color.White;
            btnerase.Image = (Image)resources.GetObject("btnerase.Image");
            btnerase.Location = new Point(444, 145);
            btnerase.Name = "btnerase";
            btnerase.Size = new Size(141, 136);
            btnerase.TabIndex = 8;
            btnerase.UseVisualStyleBackColor = false;
            btnerase.Click += btnerase_Click;
            // 
            // btn6
            // 
            btn6.BackColor = Color.FromArgb(60, 60, 60);
            btn6.FlatAppearance.BorderSize = 0;
            btn6.FlatStyle = FlatStyle.Flat;
            btn6.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn6.ForeColor = Color.White;
            btn6.Location = new Point(3, 287);
            btn6.Name = "btn6";
            btn6.Size = new Size(141, 136);
            btn6.TabIndex = 9;
            btn6.Text = "6";
            btn6.UseVisualStyleBackColor = false;
            btn6.Click += btn_num;
            // 
            // btn7
            // 
            btn7.BackColor = Color.FromArgb(60, 60, 60);
            btn7.FlatAppearance.BorderSize = 0;
            btn7.FlatStyle = FlatStyle.Flat;
            btn7.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn7.ForeColor = Color.White;
            btn7.Location = new Point(150, 287);
            btn7.Name = "btn7";
            btn7.Size = new Size(141, 136);
            btn7.TabIndex = 10;
            btn7.Text = "7";
            btn7.UseVisualStyleBackColor = false;
            btn7.Click += btn_num;
            // 
            // btn8
            // 
            btn8.BackColor = Color.FromArgb(60, 60, 60);
            btn8.FlatAppearance.BorderSize = 0;
            btn8.FlatStyle = FlatStyle.Flat;
            btn8.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn8.ForeColor = Color.White;
            btn8.Location = new Point(297, 287);
            btn8.Name = "btn8";
            btn8.Size = new Size(141, 136);
            btn8.TabIndex = 11;
            btn8.Text = "8";
            btn8.UseVisualStyleBackColor = false;
            btn8.Click += btn_num;
            // 
            // btn9
            // 
            btn9.BackColor = Color.FromArgb(60, 60, 60);
            btn9.FlatAppearance.BorderSize = 0;
            btn9.FlatStyle = FlatStyle.Flat;
            btn9.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn9.ForeColor = Color.White;
            btn9.Location = new Point(444, 287);
            btn9.Name = "btn9";
            btn9.Size = new Size(141, 136);
            btn9.TabIndex = 12;
            btn9.Text = "9";
            btn9.UseVisualStyleBackColor = false;
            btn9.Click += btn_num;
            // 
            // btn2
            // 
            btn2.BackColor = Color.FromArgb(60, 60, 60);
            btn2.FlatAppearance.BorderSize = 0;
            btn2.FlatStyle = FlatStyle.Flat;
            btn2.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn2.ForeColor = Color.White;
            btn2.Location = new Point(3, 429);
            btn2.Name = "btn2";
            btn2.Size = new Size(141, 136);
            btn2.TabIndex = 13;
            btn2.Text = "2";
            btn2.UseVisualStyleBackColor = false;
            btn2.Click += btn_num;
            // 
            // btn3
            // 
            btn3.BackColor = Color.FromArgb(60, 60, 60);
            btn3.FlatAppearance.BorderSize = 0;
            btn3.FlatStyle = FlatStyle.Flat;
            btn3.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn3.ForeColor = Color.White;
            btn3.Location = new Point(150, 429);
            btn3.Name = "btn3";
            btn3.Size = new Size(141, 136);
            btn3.TabIndex = 14;
            btn3.Text = "3";
            btn3.UseVisualStyleBackColor = false;
            btn3.Click += btn_num;
            // 
            // btn4
            // 
            btn4.BackColor = Color.FromArgb(60, 60, 60);
            btn4.FlatAppearance.BorderSize = 0;
            btn4.FlatStyle = FlatStyle.Flat;
            btn4.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn4.ForeColor = Color.White;
            btn4.Location = new Point(297, 429);
            btn4.Name = "btn4";
            btn4.Size = new Size(141, 136);
            btn4.TabIndex = 15;
            btn4.Text = "4";
            btn4.UseVisualStyleBackColor = false;
            btn4.Click += btn_num;
            // 
            // btn5
            // 
            btn5.BackColor = Color.FromArgb(60, 60, 60);
            btn5.FlatAppearance.BorderSize = 0;
            btn5.FlatStyle = FlatStyle.Flat;
            btn5.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn5.ForeColor = Color.White;
            btn5.Location = new Point(444, 429);
            btn5.Name = "btn5";
            btn5.Size = new Size(141, 136);
            btn5.TabIndex = 16;
            btn5.Text = "5";
            btn5.UseVisualStyleBackColor = false;
            btn5.Click += btn_num;
            // 
            // btn0
            // 
            btn0.BackColor = Color.FromArgb(60, 60, 60);
            btn0.FlatAppearance.BorderSize = 0;
            btn0.FlatStyle = FlatStyle.Flat;
            btn0.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn0.ForeColor = Color.White;
            btn0.Location = new Point(3, 571);
            btn0.Name = "btn0";
            btn0.Size = new Size(141, 136);
            btn0.TabIndex = 17;
            btn0.Text = "0";
            btn0.UseVisualStyleBackColor = false;
            btn0.Click += btn_num;
            // 
            // btn1
            // 
            btn1.BackColor = Color.FromArgb(60, 60, 60);
            btn1.FlatAppearance.BorderSize = 0;
            btn1.FlatStyle = FlatStyle.Flat;
            btn1.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btn1.ForeColor = Color.White;
            btn1.Location = new Point(150, 571);
            btn1.Name = "btn1";
            btn1.Size = new Size(141, 136);
            btn1.TabIndex = 18;
            btn1.Text = "1";
            btn1.UseVisualStyleBackColor = false;
            btn1.Click += btn_num;
            // 
            // btnresultado
            // 
            btnresultado.BackColor = Color.FromArgb(67, 186, 88);
            btnresultado.FlatAppearance.BorderSize = 0;
            btnresultado.FlatStyle = FlatStyle.Flat;
            btnresultado.Font = new Font("Gadugi", 20.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnresultado.ForeColor = Color.White;
            btnresultado.Location = new Point(297, 571);
            btnresultado.Name = "btnresultado";
            btnresultado.Size = new Size(141, 136);
            btnresultado.TabIndex = 20;
            btnresultado.Text = "=";
            btnresultado.UseVisualStyleBackColor = false;
            btnresultado.Click += btnresultado_Click;
            // 
            // timer1
            // 
            timer1.Interval = 30000;
            timer1.Tick += timer1_Tick;
            // 
            // Form1
            // 
            AutoScaleMode = AutoScaleMode.None;
            AutoSize = true;
            BackColor = Color.FromArgb(32, 32, 32);
            ClientSize = new Size(597, 963);
            Controls.Add(flowLayoutPanel1);
            Controls.Add(txtresp);
            Controls.Add(textOp);
            Controls.Add(pnlhistorial);
            Controls.Add(Titulo);
            Font = new Font("Gadugi", 12F, FontStyle.Regular, GraphicsUnit.Point);
            ForeColor = Color.White;
            FormBorderStyle = FormBorderStyle.None;
            Name = "Form1";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Form1";
            FormClosing += Form1_FormClosing;
            Titulo.ResumeLayout(false);
            pnlhistorial.ResumeLayout(false);
            flowLayoutPanel1.ResumeLayout(false);
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Panel Titulo;
        private Button btnExit;
        private Panel pnlhistorial;
        private RichTextBox richTextBox1;
        private TextBox textOp;
        private TextBox txtresp;
        private FlowLayoutPanel flowLayoutPanel1;
        private Button btnsum;
        private Button btnrest;
        private Button btndiv;
        private Button btnmult;
        private Button button5;
        private Button btnpartialclear;
        private Button btnclear;
        private Button btnerase;
        private Button btn6;
        private Button btn7;
        private Button btn8;
        private Button btn9;
        private Button btn2;
        private Button btn3;
        private Button btn4;
        private Button btn5;
        private Button btn0;
        private Button btn1;
        private Button btnresultado;
        private Button btnmin;
        private System.Windows.Forms.Timer timer1;
    }
}