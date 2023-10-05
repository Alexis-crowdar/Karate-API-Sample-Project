function (tokenType,access_token) {
    const tokenTypeCapitalized = tokenType.charAt(0).toUpperCase() + tokenType.slice(1);
    var authorization = tokenTypeCapitalized +' '+ accessToken;
    return authorization;
}