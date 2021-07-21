const pay = () => {
  Payjp.setPublicKey("pk_test_******************");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy_address[number]"),
      exp_month: formData.get("buy_address[exp_month]"),
      exp_year: `20${formData.get("buy_address[exp_year]")}`,
      cvc: formData.get("buy_address[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
      }
    });
  });
};

window.addEventListener("load", pay);