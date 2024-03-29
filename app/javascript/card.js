const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
//  コンソールで何も出ず、環境変数が読み込めていない可能性がある場合↓console.log(process.env.PAYJP_PUBLIC_KEY)を仕込んで無理やりコンパイルする

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("record_address[number]"),
      cvc: formData.get("record_address[cvc]"),
      exp_month: formData.get("record_address[exp_month]"),
      exp_year: `20${formData.get("record_address[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay); 