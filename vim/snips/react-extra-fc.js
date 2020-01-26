import React, { useEffect, useState } from "react";
import { withRouter } from "react-router-dom";
import "./__FileSlug__.css";

function __FileSlug__({ history, match }) {
  const [input1, setInput1] = useState(null);
  const [input2, setInput2] = useState(null);

  useEffect(() => {
    console.log("component mounted");
  }, []);

  // onChange={formUpdate(setInput1)}
  const formUpdate = (setStateVar) => (e => setStateVar(e.target.value));

  const formSubmit = e => {
    e.preventDefault();

    const promise = fetch("/url", { 
      method: "post", mode: "cors", headers: {"Content-Type":"application/json"},
      body: JSON.stringify({
        "input1": input1,
        "input2": input2
      })})

    promise.then(response=>{
      const json = await response.json()
      history.push("/redirect")
    }).catch(e=>{
      console.log("__FileSlug__", e)
    })

    return false;
  };

  return (
    <div className="__FileSlug__">
      <form onSubmit={formSubmit}>
        <input name="input1" value={input1} onChange={formUpdate(setInput1)} />
        <input name="input2" value={input2} onChange={formUpdate(setInput2)} />
        <input type="submit" />
      </form>
    </div>
  );
}

export default withRouter(__FileSlug__);
