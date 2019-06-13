void ask(){
  print('ask');
}

const a = null;
const b = 3;

// a ?? ask();

void main(){
  // ask();
  a==null ?? ask();
  b ?? ask();
}