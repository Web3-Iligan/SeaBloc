export const idlFactory = ({ IDL }) => {
  return IDL.Service({ 'hello' : IDL.Func([IDL.Text], [IDL.Text], ['query']) });
};
export const init = ({ IDL }) => { return []; };
