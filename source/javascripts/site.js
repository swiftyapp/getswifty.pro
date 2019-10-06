// This is where it all goes :)
const target = os => {
  switch (os.name) {
    case "Mac OS":
      return "mac";
      break;
    case "Windows":
      return "win";
      break;
    case "Fedora":
      return "rpm";
      break;
    case "Linux":
      return "deb";
      break;
    default:
      return "AppImage";
  }
};

window.onload = () => {
  const parser = new UAParser();
  const os = parser.getOS();
  const buttons = document.querySelectorAll(".download-button .os");
  buttons.forEach(button => {
    button.innerText = os.name;
    button.setAttribute("href", `/download/${target(os)}`);
  })
};
