void root() {
  
  // Set the style.
  gStyle->SetTextFont(80);        gStyle->SetLabelFont(80,"XYZ");
  gStyle->SetTitleFont(80,"");    gStyle->SetTitleFont(80,"XYZ"); 
  gStyle->SetPalette(1);          gStyle->SetOptStat(0);

  // Draw the plot.
  TH2D *h = new TH2D("", "", 25, 0, 3.9, 25, 0, 3.9); TRandom r; 
  for (int i = 0; i < 30000; i++) h->Fill(r.Gaus(2.,1), r.Gaus(2.,1));
  h->GetXaxis()->CenterTitle(); h->GetXaxis()->SetTitleOffset(2.5);
  h->GetYaxis()->CenterTitle(); h->GetYaxis()->SetTitleOffset(2.5);
  h->GetXaxis()->SetTitle("\\larger[2]$x$"); 
  h->GetYaxis()->SetTitle("\\larger[2]$y$");
  h->Draw("LEGO2");

  // Draw additional text.
  TText *t = new TText(); t->SetTextAlign(31);
  t->DrawText(0.7, 0.9, "\\larger[2]$z(x,y) =  \\frac{1}{\\sigma_x\\sigma_y"
	      "\\sqrt{4\\pi^2}}\\exp\\left(- \\left(\\frac{(x-\\mu_x)^2}"
	      "{2\\sigma_x^2} + \\frac{(y-\\mu_y)^2}{2\\sigma_y^2} \\right)"
	      "\\right)$");

  // Print the plot.
  gPad->Print("root.svg");
}
